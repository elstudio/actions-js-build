FROM alpine/git:lastest

LABEL version="1.0.0"
LABEL repository="https://github.com/elstudio/actions-js-build"
LABEL homepage="https://github.com/elstudio/actions-js-build"
LABEL maintainer="el-studio Actions <servers+actions@el-studio.com>"

LABEL com.github.actions.name="GitHub Action for git operations"
LABEL com.github.actions.description="Wraps the git CLI to enable common git commit commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
